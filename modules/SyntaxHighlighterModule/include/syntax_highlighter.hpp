#ifndef SYNTAXHIGHLIGHTER_H
#define SYNTAXHIGHLIGHTER_H

#include <QObject>
#include <QVector>
#include <QQuickTextDocument>
#include <QSyntaxHighlighter>
#include <QRegularExpression>
#include <QTextCharFormat>

class SyntaxHighlighter : public QSyntaxHighlighter
{
    Q_OBJECT

    Q_PROPERTY(QQuickTextDocument* document WRITE setDocument NOTIFY documentChanged)
    Q_PROPERTY(QString languageName WRITE setLanguageName NOTIFY languageNameChanged)

public:
    explicit SyntaxHighlighter(QObject *parent = nullptr);
    ~SyntaxHighlighter();

private:
    QString m_LanguageName;
    struct HighlightingRule {
        QRegularExpression pattern;
        QTextCharFormat format;
    };
    QVector<HighlightingRule> highlightingRules;

signals:
    void documentChanged();
    void languageNameChanged();

    // Getters:
public:

    // Setters:
public:
    void setDocument(QQuickTextDocument *document);
    void setLanguageName(const QString &newLanguageName);

protected:
    void highlightBlock(const QString &text) override;

private:
    void addHighlightingRule(const QString &pattern);
    void loadRulesFromFile(const QString &filePath, const QString &languageName);
};

#endif // SYNTAXHIGHLIGHTER_H
