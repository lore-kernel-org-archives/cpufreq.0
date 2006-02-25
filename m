From: Johannes Stezenbach <js@linuxtv.org>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Sat, 25 Feb 2006 13:53:37 +0100
Message-ID: <20060225125337.GB8698@linuxtv.org>
References: <20060214152218.GI10701@stusta.de> <20060222024438.GI20204@MAIL.13thfloor.at> <20060222031001.GC4661@stusta.de> <200602212220.05642.dtor_core@ameritech.net> <20060223195937.GA5087@stusta.de> <20060223204110.GE6213@redhat.com> <20060225015722.GC8132@linuxtv.org> <20060225042456.GA7851@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932704AbWBYMyW@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060225042456.GA7851@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Adrian Bunk <bunk@stusta.de>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk, ak@suse.de

On Fri, Feb 24, 2006, Dave Jones wrote:
> On Sat, Feb 25, 2006 at 02:57:22AM +0100, Johannes Stezenbach wrote:
>  > On Thu, Feb 23, 2006, Dave Jones wrote:
>  > > On Thu, Feb 23, 2006 at 08:59:37PM +0100, Adrian Bunk wrote:
>  > >  > And if the option is mostly useless, what is it good for?
>  > > 
>  > > It's sometimes useful in cases where the target CPU doesn't have any better
>  > > option (Speedstep/Powernow).  The big misconception is that it
>  > > somehow saves power & increases battery life. Not so.
>  > > All it does is 'not do work so often'.  The upside of this is
>  > > that in some situations, we generate less heat this way.
>  > 
>  > Doesn't less heat imply less power consumption?
> 
> Not really.  The only energy you're saving is that your CPU fan
> will turn slightly slower, which is probably going to be < 1W
> of difference.

I thought the fan turns slower because the CPU generates
less heat, which in turn is because it consumes less
electrical energy.

If someone has done measurements I'd be interested to
know the numbers about the actual power savings which
can be achieved by using P4 clock mod. I don't expect
it to be much, but I bet it's more than 1W.


Johannes
