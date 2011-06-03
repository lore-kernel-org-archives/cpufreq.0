From: Star Sweeper <starsweeper@yahoo.com>
Subject: cpufreq doesn't work with AMD E-350 (Fusion)
Date: Fri, 3 Jun 2011 03:48:59 -0700 (PDT)
Message-ID: <423945.47085.qm@web121206.mail.ne1.yahoo.com>
Reply-To: Star Sweeper <starsweeper@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1307098139; bh=8MQxYSCb7pNYQn2FPQ61DAEHZk1kpR5Xf0S2+LUTuNE=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=PBcAgAbfmVnEKK7sdV6F1UUyxruGS+R8PJguqOiST7MU+gOUtrzmVNymaGaTyRV1F7xcTsDLb1T4/mPiZP6DP6flp0GBPsUfyqQwyUed/Ycocg65wLjFcRtsoq3LhDO3AzN6IZQHhwuMrp6RR3a6udmFPOaewFU7+LGBXcN0IKM=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

I have an ASRock E350M1/USB3, which appears to be unsupported by cpufre=
q:

/usr/sbin/dmidecode | grep -i processor
Processor Information
=A0 =A0 =A0 =A0 Type: Central Processor
=A0 =A0 =A0 =A0 Version: AMD E-350 Processor=A0

/usr/bin/cpufreq-info=A0
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
=A0 no or unknown cpufreq driver is active on this CPU
=A0 maximum transition latency: 4294.55 ms.
analyzing CPU 1:
=A0 no or unknown cpufreq driver is active on this CPU
=A0 maximum transition latency: 4294.55 ms.
