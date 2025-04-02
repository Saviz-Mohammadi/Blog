#ifndef CLIPBOARD_H_H
#define CLIPBOARD_H_H

#include <QObject>
#include <QClipboard>
#include <QUrl>
#include <QString>

class Clipboard : public QObject
{
    Q_OBJECT

public:
    explicit Clipboard(QObject *parent = nullptr);
    ~Clipboard();

private:
    QClipboard *m_Clipboard;

signals:
    void textCopiedToClipboard();

public:
    Q_INVOKABLE void copyToClipboard(const QString &text);

    // Getters:
public:

    // Setters:
public:
    void setClipboard(QClipboard *newClipboard);

};

#endif // CLIPBOARD_H_H
