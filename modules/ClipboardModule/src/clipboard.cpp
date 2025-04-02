#ifdef QT_QML_DEBUG
#include <QDebug>
#endif

#include "clipboard.hpp"

Clipboard::Clipboard(QObject *parent) : QObject(parent), m_Clipboard(nullptr)
{
}

Clipboard::~Clipboard()
{
}

void Clipboard::copyToClipboard(const QString &text)
{
    this->m_Clipboard->setText(text, QClipboard::Clipboard);

    emit textCopiedToClipboard();
}

void Clipboard::setClipboard(QClipboard *newClipboard)
{
    if(m_Clipboard == newClipboard)
    {
        return;
    }

    this->m_Clipboard = newClipboard;
}
