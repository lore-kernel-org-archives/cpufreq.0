From: Guru Prasad <gurupras@buffalo.edu>
Subject: cpufreq and memory intensive benchmarks
Date: Fri, 2 Aug 2013 15:45:10 -0400
Message-ID: <CAMefCkCv1vXWJ3wVq0i3uugmPoXRVHscfDsk1J3h3amtpLsZ6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type;
        bh=D5LscSNervu8Sl08hIkTVLvWVggMrjuiubGny/uymHg=;
        b=jhxPGFLUalODBWcTbSQA+dBcjONe+OvBGrAAlfyuFUGyT0VOil5QPCbVa7UrBZWisO
         KfYqbi3pxjVDZUkm/oRKlsg8Jb43aWYHtPApeE1HCV1WTh7pySPO2bwr7jkVH8d/7/xK
         8xcrW6PS4/TJqsMQ7HVdoaXbqoa+amJ+FWdI21d/sSz+nLj0FynLQStA2lRwnSOSNMnH
         tmJxWsbsEcHEJp3YYeevwWzqd4ZAJhy/09VuUWyvpGZ5Rw8RIo16Iu5q1sTusxvyrzeZ
         OOu3n8E55YoOEJrkS2c0mVAj3KblMD/6tpSdlgPNg0bJfFlsL0F3YmbDlqHpsCUFi6qG
         MhAA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Hi,

I was recently running some SPEC benchmarks to test the way in which
cpufreq module adjusts the CPU frequency for various benchmarks and I
noticed that cpufreq always tends to rest at the maximum frequency
regardless of the benchmark on ondemand / conservative.

I then tried to identify memory intensive benchmarks
(http://users.elis.ugent.be/~leeckhou/papers/isca12-2.pdf) and upon
running milc / libquantum, I noticed that the same trend continued.

Does this mean that memory operation latencies are attributed as CPU busy time?
Could someone explain the inner workings behind this? What does the
CPU *really* do while the load/store is executing? Is it busy-waiting
/ idle?


Regards
Guru
