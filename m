From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: cpupowerutils: easier use of msr and cpuid stuff and some more
Date: Tue, 5 Oct 2010 16:43:40 +0200
Message-ID: <20101005144340.GA8116@isilmar-3.linta.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <20101005141532.GA10182@comet.dominikbrodowski.net> <201010051637.58138.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201010051637.58138.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Hey,

On Tue, Oct 05, 2010 at 04:37:57PM +0200, Thomas Renninger wrote:
> On Tuesday 05 October 2010 16:15:32 Dominik Brodowski wrote:
> > - instead of adding two options to cpufreq-info doing the same,
> >   I only added one (--boost / -b) 
> I agree.
> 
> I can send updates if you pushed them in.

For the -b / -t thing, I already modified the patch; otherwise see

git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git cpupowerutils 

Best,
	Dominik
