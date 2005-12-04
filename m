From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Sun, 04 Dec 2005 18:01:57 -0300
Message-ID: <200512042102.jB4L1vUI016069@pincoya.inf.utfsm.cl>
References: <rlrevell@joe-job.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751099AbVLEBXP@vger.kernel.org>
In-Reply-To: Message from Lee Revell <rlrevell@joe-job.com> 
   of "Sun, 04 Dec 2005 14:49:26 CDT." <1133725767.19768.12.camel@mindpipe> 
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Andi Kleen <ak@suse.de>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

Lee Revell <rlrevell@joe-job.com> wrote:

[...]

> Wrong, lots of userspace programs that need to know the CPU speed get it
> from /proc/cpuinfo.  It would be nice if there were a better API.

Why would a /user/ program need to know what the CPU speed is?

In any case, /proc is not the place for this, as it has nothing to do with
processes.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
