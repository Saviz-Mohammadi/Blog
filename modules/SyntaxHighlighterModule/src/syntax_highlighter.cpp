#include "syntax_highlighter.hpp"
#include <QTextDocument>
#include <QFont>
#include <QColor>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

SyntaxHighlighter::SyntaxHighlighter(QObject *parent) : QSyntaxHighlighter(parent), m_Document(nullptr), m_LanguageName(QString())
{

}

SyntaxHighlighter::~SyntaxHighlighter()
{

}

void SyntaxHighlighter::addHighlightingRule(const QString &pattern)
{
    QTextCharFormat format;

    format.setForeground(Qt::blue);
    format.setFontWeight(QFont::Bold);

    HighlightingRule rule {
        .pattern = QRegularExpression(pattern),
        .format = format
    };

    this->highlightingRules.append(rule);

    this->rehighlight();
}

void SyntaxHighlighter::loadRulesFromFile(const QString &filePath, const QString &languageName)
{
    QFile file(filePath);

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
#ifdef QT_DEBUG
        qDebug() << "Could not open file:" << filePath;
#endif
        return;
    }

    QByteArray data = file.readAll();

    file.close();

    QJsonDocument document = QJsonDocument::fromJson(data);

    if (!document.isObject())
    {
#ifdef QT_DEBUG
        qDebug() << "Invalid JSON in file:" << filePath;
#endif
        return;
    }

    QJsonObject rootObj = document.object();

    if (!rootObj.contains(languageName))
    {
#ifdef QT_DEBUG
        qDebug() << "Language" << languageName << "not found in JSON file";
#endif
        return;
    }

    QJsonValue languageRulesValue = rootObj.value(languageName);

    if (!languageRulesValue.isArray())
    {
#ifdef QT_DEBUG
        qDebug() << "Expected an array of rules for language:" << languageName;
#endif
        return;
    }

    QJsonArray rulesArray = languageRulesValue.toArray();

    this->highlightingRules.clear();

    for (const QJsonValue &ruleValue : rulesArray)
    {
        if (!ruleValue.isObject())
        {
            continue;
        }

        QJsonObject ruleObj = ruleValue.toObject();
        QString pattern = ruleObj.value("pattern").toString();

        this->addHighlightingRule(pattern);
    }
}

QQuickTextDocument *SyntaxHighlighter::getDocument() const
{
    return(this->m_Document);
}

QString SyntaxHighlighter::getLanguageName() const
{
    return(this->m_LanguageName);
}

void SyntaxHighlighter::setDocument(QQuickTextDocument *document)
{
    if (this->m_Document == document)
    {
        return;
    }

    this->m_Document = document;

    QSyntaxHighlighter::setDocument(m_Document->textDocument());

    emit documentChanged();
}

void SyntaxHighlighter::setLanguageName(const QString &newLanguageName)
{
    if (this->m_LanguageName == newLanguageName)
    {
        return;
    }

    this->m_LanguageName = newLanguageName;

    this->loadRulesFromFile(":/resources/json/syntax highlighting.json", this->m_LanguageName);

    emit languageNameChanged();
}

void SyntaxHighlighter::highlightBlock(const QString &text)
{
    for (const HighlightingRule &rule : std::as_const(highlightingRules))
    {
        QRegularExpressionMatchIterator iterator = rule.pattern.globalMatch(text);

        while (iterator.hasNext())
        {
            QRegularExpressionMatch match = iterator.next();
            int start = match.capturedStart();
            int length = match.capturedLength();

            this->setFormat(start, length, rule.format);
        }
    }
}
