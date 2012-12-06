From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 23:53:21 +0100
Message-ID: <4229849.RHq1rkTPVe@vostro.rjw.lan>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <1848925.yZaqRNHFOk@vostro.rjw.lan> <50C1175F.7040602@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C1175F.7040602@linux.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: David C Niemi <dniemi@verisign.com>, dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, deneen.t.dock@intel.com

On Thursday, December 06, 2012 02:08:31 PM Arjan van de Ven wrote:
> On 12/6/2012 1:34 PM, Rafael J. Wysocki wrote:
> >>>>>
> >>>>> * Uncompromised performance
> >>>>> * Balanced - biased towards performance     (say, defined to be lowest power at most a 2 1/2% perf hit)
> >>>>> * Balanced                                  (say, at most a 5% perf hit)
> >>>>> * Balanced - biased towards lower power     (sat, at most a 10% perf hit)
> >>>>> * Uncompromised lowest power
> 
> 
> > That said starting with a small value and going up exponentially, like
> > (1->)2->4->8->16->32->64, sounds like a good idea.
> 
> 
> ... like 2 1/2, 5 and 10 ? ;-)

In that case I'd prefer 2, 5, 10, 25, 50.  I don't think we can be as precise
here as to go into fractions realistically.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
