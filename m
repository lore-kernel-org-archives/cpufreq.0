From: Sebastian <sebastian_ml@gmx.net>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files
 = freeze
Date: Thu, 23 Dec 2004 12:15:42 +0100
Message-ID: <41CAA8DE.5060300@gmx.net>
References: <41C83AA7.6010204@gmx.net> <1103742159.16413.24.camel@localhost>
	<20041222203136.GB21861@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040706060200080707010108"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041222203136.GB21861@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, cpufreq list <cpufreq@www.linux.org.uk>

This is a multi-part message in MIME format.
--------------040706060200080707010108
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dave Jones schrieb:
> On Wed, Dec 22, 2004 at 11:02:39AM -0800, Jeremy Fitzhardinge wrote:
>  > On Tue, 2004-12-21 at 16:00 +0100, Sebastian wrote:
>  > > Dear Jeremy,
>  > > 
>  > > thanks for your tool! I like it best of all cpufreq daemons,
>  > 
>  > Thanks!
>  > 
>  > This problem sounds like a bug in the longhaul driver though, which I
>  > don't really know anything about.  (The system should never crash,
>  > regardless of what speedfreqd does.)  
>  > 
>  > I've cc:d the cpufreq list to see if someone there can help.  Dave?
> 
> Yeah, longhaul is badly broken right now, and tbh, I've no idea
> what on earth is wrong. Speed transitions happen, and work correctly.
> Then a few minutes later, system locks up.
> 
> I've been trying all sorts of things, from disabling PCI mastering,
> disabling CPU caches, etc, but nothing seems to help. I'm truly puzzled.
> 
> 		Dave
> 
> 

Dear Jeremy, dear Dave, dear list,

I tried to collect more information using cpufreq.debug={1,2,3,4}. But I 
don't see anything helpful in the output. Maybe you can find somehing, 
so I'm going to attach it anyway. Would it be interesting to see if a 
previous kernel version like 2.6.5 worked? I sure could install an 
earlier kernel if you like. Maybe this has not so much to do with the 
cpufreq-longhaul driver but with changes to the IO-section of the kernel?
A few days ago I converted all partitions on the computer from reiserfs 
to xfs, but as you can see, this didn't change anything regarding the 
freezes :)

Regards

Sebastian

P.S.: I hope you don't mind me attaching the various output as a 
.bz-file. Unpacked it's ~24kB, bzipped only ~3kB.

Thanks

Sebastian

--------------040706060200080707010108
Content-Type: application/octet-stream;
 name="cpufreq_debug_epia_me6000.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="cpufreq_debug_epia_me6000.bz2"

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
BJ3u83//i7kinChIUUK6/gA=
--------------040706060200080707010108
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------040706060200080707010108--

