From: karthik vm <meetvm@gmail.com>
Subject: Few clarifications on DVFS
Date: Sun, 15 Sep 2013 20:30:51 -0400
Message-ID: <CAOuKo4nZ5Yij3cnM=PuMR3awJ2QAbY4O+-mKi110xfc66xyWUg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=iJ7a2MobgktvYQmRw8xDUmy2T7bRxxn0wLh6NmCQd5c=;
        b=wntR1v3+/74b1myuT7hN6vmX58vU0g0nmTYu0crgpxeuOmSAfCI0C+A3jJNxyov8Gs
         oFrF1CEC23PXPDmDtUTmnWavsDesX0ebz0AD5RfTH+gTF68U4YaE1lNH3JTA8KtfdFZr
         uNb7cTEvua7QaJMjve3iW4fNWdCh9Qoyna+xBInCZRvURRkHy0KBQ75gIWmafW47gw7W
         R05XabcGAec0+QG6kGcfq3qDxchfrQ4xMbnZDtghokpr9olT/HBjoCmeGjxdzwbuHu3l
         /aZ3nyfhFj1iuKi+1Seahj74/EtupfVKtXvXkSEDn2SJizE4tUlJx3uHVASUnu9p7QMo
         LFRA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@vger.kernel.org>

Hi,

I am a PhD student doing research in DVFS area. I have few questions
for which I am looking for an answer. It would be great if some one
could give some pointers.

1) In my current Core2Duo laptop, "maximum transition latency" from
cpufreq-info command is 10us. Hence I get that to change the frequency
of my cpu it takes 10us. Also recent research papers say that the
frequency of the processor can be changed in ns scale (eg. 10 ns -
100ns). If that is the case, can processor frequency be still modified
thru OS? Will OS be able to handle such a fine grained frequency
change?

2) Currently the frequency change is handled by governors. But is it
possible to change the frequency of a cpu directly by calling the
CPU-driver functions from another part of the kernel?

Thanks for your time,
karthik
