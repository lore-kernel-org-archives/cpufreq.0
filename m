From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: 3.9-linux-next-20130501: OOPS in intel_pstate_sample
Date: Fri, 10 May 2013 14:20:41 -0600
Message-ID: <CAErSpo4x4Y3sJdvaYyTXT1pPAehrnD5ExA+qzpgkbNiqiU2yVA@mail.gmail.com>
References: <51818334.7020201@fold.natur.cuni.cz>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=x-received:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=m15OswYdDF1yIkVaMW1jvDLPvXuqpPVpVTKOyrn53YY=;
        b=kZyNDmv93VP74MOHxJ7BqJ61MSH9Psb83F/Jy0d3CdGEmMPPViUPtpiUKCVh7eZ3sI
         3gYtiOxYSqn307ctbz/kyK/W+tGxcNdhvNf0bs7LkfSqT2gNPy9XfaxSZNUOacEknoTT
         cGS4u4bwtNVE0Wr8ijCM3jxnr7XJtsPEeSmXY5yNXsm7kb2gzwu2fWK2BF9MrtaYhex7
         BGRhdhxtCL4VM07JebxM0yUsqVmN1+ZahaGTHa/cWeYg8XSFR7HDKrtbBpFhJ2o4QGRB
         vqUQWzg+3xGvIlcpnr3tM9v9skEUvUir0QQtY+754BPli+cEVSn9O4cdHn77kMsp8WLy
         fyyQ==
In-Reply-To: <51818334.7020201@fold.natur.cuni.cz>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Mokrejs <mmokrejs@fold.natur.cuni.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Toshi Kani <toshi.kani@hp.com>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Dirk Brandewie <dirk.brandewie@gmail.com>

[+cc Viresh, Srinivas, Dirk, cpufreq list]

On Wed, May 1, 2013 at 3:03 PM, Martin Mokrejs
<mmokrejs@fold.natur.cuni.cz> wrote:
> Hi,
>   I opened yet another bug https://bugzilla.kernel.org/show_bug.cgi?id=57411 .
>
> This is maybe a dupe of bug https://bugzilla.kernel.org/show_bug.cgi?id=57401
> (which is vanilla 3.9) but happened on linux-next-20130501 after I did "dmesg | less".
>
> ? pid_param_set
> intel_pstate_timer_func
> call_timer_fn
> ? __internal_add_timer
> ? pid_param_set
> run_timer_softirq
> __do_softirq
> irq_exit
> smp_apic_timer_interrupt
> apic_timer_interrupt
> ? sysret_check
>
> A camera picture of the stacktrace is attached to the bug https://bugzilla.kernel.org/show_bug.cgi?id=57411
> Please forward this to the appropriate person.
> Thanks,
> Martin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
