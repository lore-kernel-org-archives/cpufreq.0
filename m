From: Raj Kumar <rajkumar278@gmail.com>
Subject: Question regarding during system suspend
Date: Sun, 24 Oct 2010 21:39:20 +0200
Message-ID: <AANLkTinXYc6LVHvguY4hnD0OF=56Tww8h_iyso+N_Mx5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=itb6d9i+3mmQGsrLi3F7N6mStMdkrlRU50EOL8yEUYw=;
        b=LgQYc+NfTtfiSnV3eeJ/SmUNGpo84ZtjBcv73uAljshWIwshohH0BVf7gdB01v2vYk
         FyRld1RyKtrx/FVzvCvGXwUhfvpTY+Qrj0f415XTFhkBwQmTZkDEpDw5U4xjoIx7uKul
         00A1AO2XTciGMSD+WwGiZRaT6TF/IvOeKYhJ0=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I have a question regarding DVFS.

1) If the system suspends, Is the DVFS means clock scaling possible
after system suspend (suspend to ram) . I assume after system
suspend, all the devices is in the low power mode so no clock scaling
is possible after system suspend.

right? please correct me if i am wrong.

Regards
Raj
