From: Johannes Stezenbach <js@linuxtv.org>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Mon, 27 Feb 2006 00:37:45 +0100
Message-ID: <20060226233745.GA6804@linuxtv.org>
References: <20060214152218.GI10701@stusta.de> <20060223204110.GE6213@redhat.com> <20060225015722.GC8132@linuxtv.org> <200602250527.03493.ak@suse.de> <20060225125326.GJ3674@stusta.de> <20060225132820.GA13413@isilmar.linta.de> <20060226203941.GA5783@linuxtv.org> <20060226205513.GA26486@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751425AbWBZXhs@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060226205513.GA26486@isilmar.linta.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Adrian Bunk <bunk@stusta.de>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Sun, Feb 26, 2006, Dominik Brodowski wrote:
> On Sun, Feb 26, 2006 at 09:39:41PM +0100, Johannes Stezenbach wrote:
> > 
> > Do you have the numbers for a Pentium(R) 4 HT? (I couldn't find
> > anything substantial with google.) Especially C2 vs. C2 + throttling?
> > Because the way I remember having read somewhere, the idle
> > (C2) power consumption of the P4 is significantly higher
> > than with the Pentium(R) M.
> 
> Unfortunately, I do not have these numbers present. You can check the
> processor specification sheets at Intel's website, though.

Went to the Intel(R) website, searched for half an hour, found many
docs but none that gives useful information about this, gave up. :-(

> > > So: P4-clockmod style throttling only makes sense if either
> > > 
> > > a) the idle handler does not enter the Stop-Grant state (C2) efficiently, or
> > 
> > Maybe my previous mails were not clear enough: The goal is to
> > reduce idle power consumption (and by that fan noise). The PC
> > is running but is idle, e.g just listening for possible incoming
> > jabber messages or whatever.
> 
> Most probably, the idle handler can't make use of the Stop-Grant state (C2)
> here, so this is case a) noted above.

Hm.

Thanks,
Johannes
