From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: Disable cpufreq on modern X86 processors
Date: Tue, 24 Jul 2012 06:23:59 -0700
Message-ID: <500EA1EF.7020503@linux.intel.com>
References: <201207241515.15324.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201207241515.15324.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org, Len Brown <lenb@kernel.org>, Borislav Petkov <borislav.petkov@amd.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Michael Galbraith <mgalbraith@suse.de>

> 
> Arjan mentioned quite some time ago, that for modern X86
> processors it does not make much sense to control the
> frequency of the CPU via OS, because idle states are
> much more efficient and should get entered asap.

well need to qualify that.
it does not make sense to control the frequency the way we are doing,
because during idle the frequency is zero (as is the voltage).
ondemand logic has different assumptions.


we have been reworking a new governer like thing inside Intel, and are
close to publish it to lkml (and this list).
the problem always is that there are many workloads and one shouldn't
regress bla bla bla so this is needs a lot of data collection (which
takes time)


