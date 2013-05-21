From: karthik vm <meetvm@gmail.com>
Subject: Clarification on the DVFS capabilities
Date: Tue, 21 May 2013 12:18:40 -0400
Message-ID: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=bVdAzmluq9i/mAllfy90UHtGiVPubrPAsFJ5O3dFwcs=;
        b=t2JEdCYUxG1RR2M3ZZXFaWM5B+eiXJOfvMJ+/WTsTdVPnlN1HGwhgfdSFAfsBKF+Wg
         FtasjByGF36jBsjm7yIWnDrlQI41YZz+yh+Siq7nlrfK+CrcweF06wvnm9zMpSTz6J1Z
         qeyUCw0TROWbHU2aTfwCBgK7tdTdhJFNB8ESc2iaT/b0++aS/smjp5PkLcikoUpjK5+N
         jxyv67dudv0d42nKhmCnaxpGk9qD0srln2PceafJKyQPZZHxaWsCLbcqj56grVgaj/rr
         62JCFkKdyoNvOZAC7QjfhuAPJ3nHfgb+9+WRy8xlmuLaO/SLTniHsst4u7dxGAMd8VT1
         kzlg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@vger.kernel.org>

Hi,

I have few doubts on the DVFS capabilities of my intel Core2Duo
processor (T5750) which has 2 cores (no hyperthreading) and has
Enhanced Intel Speed Step Technology (EIST). When I run the
"cpufreq-info" command in Ubuntu Linux I get the result that: "CPUs
which run at the same hardware frequency: 0 1". Hence I assumed that
both the CPUs will increase and decrease the frequency in a
synchronous fashion.

But when I tried to verify it by using the below command:

$ watch -n 0.1 grep \"cpu MHz\" /proc/cpuinfo

Here I see that each core is varying the frequency individually
contrary to the cpufreq-info commands output that both run at the same
hardware frequency. Hence can anyone comment on this behavior?

Regards,
karthik
