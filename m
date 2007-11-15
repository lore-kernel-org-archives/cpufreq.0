From: Eric Piel <Eric.Piel@lifl.fr>
Subject: Re: Kernel panic at boot with ondemand governor as	default	(2.6.24-rc2)
Date: Fri, 16 Nov 2007 00:37:28 +0100
Message-ID: <473CD838.8060300@lifl.fr>
References: <4737539F.2070401@lifl.fr>	 <1194859012.4590.595.camel@queen.suse.de>  <47385D05.20705@lifl.fr> <1194880989.5474.12.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933918AbXKOXiW@vger.kernel.org>
In-Reply-To: <1194880989.5474.12.camel@queen.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: trenn@suse.de
Cc: linux-kernel@vger.kernel.org, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@lists.linux.org.uk>

2007=E5=B9=B411=E6=9C=8812=E6=97=A5 16:23, Thomas Renninger wrote/a =C3=
=A9crit:
> On Mon, 2007-11-12 at 15:02 +0100, Eric Piel wrote:
:
>> Another way would be to=20
>> reorganise the initialisation code so that workqueue is initialised=20
>> before the cpufreq framework is started, do you think it's possible?
> Making all this work with low-level drivers built in would be perfect=
 of
> course...
Hi, I've just checked and it seems a bit weird, at least not as I=20
expected: the workqueue is already initialized _before_ cpufreq! At=20
least, from what I read in init/main.c, in do_basic_setup(), first ther=
e=20
is a call to init_workqueues(), then there is a call to do_initcalls()=20
(which indirectly calls cpufreq_core_init()). So maybe workqueues need=20
something more than being initialized to work? What could it be? (My=20
kernel is compiled for monoprocessor,  I can't see what goes wrong in=20
wq_per_cpu()).

See you,
Eric
