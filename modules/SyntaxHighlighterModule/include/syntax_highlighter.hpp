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

    Q_PROPERTY(QQuickTextDocument *document READ getDocument WRITE setDocument NOTIFY documentChanged)
    Q_PROPERTY(QString languageName READ getLanguageName WRITE setLanguageName NOTIFY languageNameChanged)

public:
    explicit SyntaxHighlighter(QObject *parent = nullptr);
    ~SyntaxHighlighter();

private:
    QQuickTextDocument *m_Document;
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
    QQuickTextDocument *getDocument() const;
    QString getLanguageName() const;

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
