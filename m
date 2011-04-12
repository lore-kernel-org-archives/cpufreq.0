From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: pcc-cpufreq bug [Was: Bug in cpufreq-utils
 (/sys/devices/system/cpu/cpu*/cpufreq/affected_cpus)?]
Date: Tue, 12 Apr 2011 21:48:11 +0100
Message-ID: <20110412204811.GA9465@srcf.ucam.org>
References: <4D9DEC01020000A1000059B5@gwsmtp1.uni-regensburg.de>
 <20110412203915.GB12827@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110412203915.GB12827@comet.dominikbrodowski.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>, Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>, nagananda.chumbalkar@hp.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Tue, Apr 12, 2011 at 10:39:15PM +0200, Dominik Brodowski wrote:

> To the pcc-cpufreq.c driver developers & maintainers: Is there _any_ way to
> properly set
> 
> 	(struct cpufreq_policy *) -> cpus
> 				  -> related_cpus
> 
> in this driver?

The spec says we should be able to do this with the _PSD data. I'll look 
into it.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
