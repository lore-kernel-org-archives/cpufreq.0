From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: 'cpufreq-set -g performance -r' does not set all CPUs (AMD only?)
Date: Sun, 31 Jul 2011 10:57:06 +0200
Message-ID: <20110731085706.GB19629@comet.dominikbrodowski.net>
References: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gentoo.org>
Cc: cpufreq@vger.kernel.org, Juergen Rose <rose@rz.uni-potsdam.de>

Hey,

On Sun, Jul 31, 2011 at 12:46:31AM -0400, Matt Turner wrote:
> I've got a bug report about cpufreq-set -r not setting all related
> CPUs. It appears to be a problem with AMD CPUs only.
> 
> https://bugs.gentoo.org/show_bug.cgi?id=376565
> 
> Any ideas what's going on?

What's the output of cpufreq-info on these systems? Might it be that the
CPUs on this AMD system may be set to different frequencies? "-r" only sets
the governor on all _related_ CPUs, not on all CPUs found on the system.

Best,
	Dominik
