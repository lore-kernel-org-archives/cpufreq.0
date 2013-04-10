From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [RFC PATCH] kbuild: Build linux-tools package with 'make deb-pkg'
Date: Wed, 10 Apr 2013 09:41:55 +0200
Message-ID: <CA+icZUU=SdiaPBqabf0miOM1Arsc=PjHQbY4GpaDiM4=Fbp73A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:date:message-id:subject:from:to:cc
         :content-type;
        bh=pb7mX4A6pxNQaQOOFlK9EVziogLbwl7K+jOD4kGuIbQ=;
        b=QEUY5BXjtQ5Mb4EdMFJKei2z+gfbDODqikUGiuEeK9Bd40SjliKBUSUhYIVPgDGXHh
         bofBkz7Szkx0DCQGrlt9rbwjWoPpC8ikB9CEWhRPBbMRXVbCWrC/XnXBdilIQ0QWhr11
         +bIaGVMMjkkxJknkaMN0qCkW+DaZ2mb/LAXTmaesSa6N5KjEH3XI2Ry1v0Jy2W+o07sD
         0U8FzzuDtbNBLMdgZ1wKdFlTxz1lKA5bTQOr1n210HtHZXoelew1yX1dTEJeQ/cVSnvP
         BA+jHuOSMZCrGuZhOVQNKGX56x94sppoK3di5HswMTnw0QQM3qEhdYPDSfCKlWEjElZ9
         3NjQ==
Sender: linux-next-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, debian-kernel@lists.debian.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

[ CCing some involved maintainers and MLs ]

Hi Joerg,

what is the status of your proposal patch?
Is this [1] the last version you posted?

What's with the integration into linux-kbuild?

Background of my asking is that I need to build cpufreq-info shipped
with the kernel-sources in tools-dir to track down a BROKEN Linux-Next
release (see [2]).

Thanks in advance.

Regards,
- Sedat -

[1] http://lists.debian.org/debian-kernel/2012/02/msg01009.html
[2] http://www.spinics.net/lists/cpufreq/msg05291.html
