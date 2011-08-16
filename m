From: Luca Niccolini <luca.niccolini@for.unipi.it>
Subject: Frequency Levels - Linux vs. FreeBSD
Date: Mon, 15 Aug 2011 18:30:40 -0700
Message-ID: <CA+QcM5QFRpH9MA7oUDbjy-2X5vv6gNjWHnSGPEF9ugX8O96Arw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:from:date:x-google-sender-auth:message-id
         :subject:to:content-type;
        bh=bcv22G+17kxBZ/UeIAZSQj/Rv3KSWp4ecVSpIoCzKd4=;
        b=RtGgV848qnBH/0peXPs+79RuKgABNshEBZl5FftjqAoOik+uUSN58PTGQMYeNc4vtX
         rv2LBE5Ojq0n0miq1Pqxn0mFNSTKxF8QqvGKBkoETIzJzHnfxmvNqoNphfpreyXDuBRM
         G5ggxe6aN/k8f31i/UPhuOsK2C/gwyaBo+eRg=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

I would like to signal you a difference in the cpufreq subsystem
between Linux and FreeBSD.
The two systems show a different number of available frequency levels,
and non-overlapping frequencies, with FreeBSD showing a minimum frequency
approximatively 4 times less than Linux minimum frequency.

On an Intel Xeon X5680 CPU, for example, I got this (with frequencies in kHz):

Linux            FreeBSD
3333000      3333000
3200000      2916000
3067000      2499000
2933000      2083000
2800000      1666000
2667000      1249000
2533000        833000
2400000        416000
2267000
2133000
2000000
1867000
1733000
1600000

As you can see Linux Cpufreq offers a higher granularity on a narrower range.
Were you aware of this discrepancy? Do you know what is the reason behind that?

Thanks in advance.
Luca Niccolini
