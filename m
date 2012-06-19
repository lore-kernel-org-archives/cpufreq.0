From: Abdul Wahid Memon <engrwahidmemon@gmail.com>
Subject: cpufreq-set on arm
Date: Tue, 19 Jun 2012 14:41:48 +0200
Message-ID: <CAM8ts8c2OwTK3daLFVzqqB5E4TEp4eeDWiK9jnkj=oN-e-HvdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=/Q41jOUvF8DPdcMU8JzWiWnH6KsE5dQMmqlT9GeXTiE=;
        b=O6Uslj5wg4NOTcz1ZMc40q22RXcxrVdFfC5gRz9sPNs5CABXSR8XU2oQIFjHhGC3Qq
         tOmRtzskck6JHWx1Dc+8bh42weVxPdpwjN3fKo2G2roT4xTwF8n2QSp1lqSq5B0pZvk/
         UsNx0Cvxrdqto/L1CpnM4o+pVGfcC2xhcTDZPbUxdP1L/HVf6tdEihmIeCEqHNsVFqP/
         e8m0gg5LO7DoRnuNNBpIyHroZOTsT1787hN7NjBhafyYgmrTW+L4GHdOSmgFDl6YZ9k9
         qpYTaO8GDczWh8KB/TdnNV2ydZ9AeA4/ZfzjREk5TP57NsRVV2rpFER9Yplc5Kk+9dqc
         dYEQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hello everyone

I am having some problem while setting frequency on my OMAP4430 T1 board.

The maximum available frequency is 1.20GHz, and scaling_max_freq does
show 1200000 but I am unable to set the frequency higher than 600 MHz.

There are 5 different speed steps available but I can use only 2 i.e.
300 MHz and 600 MHz.

Any help would be really helpful.

Regards

Abdul
