From: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Subject: Re: Suspend to RAM regression tracked down
Date: Sun, 09 Jul 2006 08:55:02 +1000
Message-ID: <1152399303.14453.29.camel@idefix.homelinux.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org> <1152271537.5163.4.camel@idefix.homelinux.org>
	 <20060707162152.GB3223@redhat.com>
	 <1152312530.14453.16.camel@idefix.homelinux.org>
	 <20060708062345.GB3356@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030417AbWGHWzK@vger.kernel.org>
In-Reply-To: <20060708062345.GB3356@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

> If you're prepared to play around with 'git bisect' a little, it shouldn't
> take that many iterations, as you've already narrowed it down quite a lot.
> 
> $ git bisect start drivers/cpufreq/cpufreq_ondemand.c
> $ git bisect bad
> $ git bisect good v2.6.12-rc5
> 
> should get you most of the way there.
> 
> http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html
> has more info.

Could you give me a bit more info, since I've never used git before (I
only downloaded the git snapshots)? Also, if I understand correctly,
cpufreq_ondemand.c is the only file that could cause the problem. Is
that right? Also, is it possible to use an old version of it on a new
kernel?

	Jean-Marc
