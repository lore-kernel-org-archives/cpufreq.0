From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC][PATCH] cpufreq: db8500: remove unneeded for loop iteration
 over freq_table
Date: Tue, 27 Sep 2011 09:35:46 +0200
Message-ID: <CACRpkdbhqq3Y85pf+i=ssP2MKVW_ROL5QpFvAy0ffHMbshrSQA@mail.gmail.com>
References: <1317107502.2327.4.camel@phoenix>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1317107502.2327.4.camel@phoenix>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, cpufreq@vger.kernel.org, Jonas ABERG <jonas.aberg@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, Sep 27, 2011 at 9:11 AM, Axel Lin <axel.lin@gmail.com> wrote:

> Don't know why to do the loop iteration here. It looks unneeded.

I'm OK with this going in, however I already have another patch
on the CPUfreq driver pending for review that is more crucial and
hopefully can go in first?

It sure looks odd. Jonas has some refactorings done on the
CPUfreq driver, however they are dependent on the PRCMU update
that is pending review for the MFD tree to go in first, so there
is some code stacking up cross-subsystemwise right now.

Yours,
Linus Walleij
