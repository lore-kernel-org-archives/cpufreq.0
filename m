From: GoatZilla <goatzilla@gmail.com>
Subject: Re: Re: Manual PST settings for "unrecognized CPUs"
Date: Sun, 22 Aug 2004 14:34:00 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e34848040822123467f270f9@mail.gmail.com>
References: <20040822100211.42415.qmail@web86906.mail.ukl.yahoo.com>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_Part_32_582009.1093203240556"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040822100211.42415.qmail@web86906.mail.ukl.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk

------=_Part_32_582009.1093203240556
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Well, I figured it out.  

Since I'm under the impression my BIOS doesn't have any of this
powersaving stuff, I decided to bypass all of that.  The only relevant
thing to come out of the PSB area is the latency, which I just
arbitrarily set to 200.  Then I go through the same PST motions as
before and make sure maxfid and startvid's match up from the
commandline, and I'm good to go.  I can scale from 300MHz to a slight
overclock at 1900MHz (to compensate for having set the FSB to 100 to
reach 300MHz in the first place).


Mark Newman:  I think you probably just botched the patch.  Make sure
you cut and paste the patch from Milz's email properly.



On another note...  how come I can't choose the powersave governor to
be the default governor?  That's actually the one I want to start out
with.

------=_Part_32_582009.1093203240556
Content-Type: text/plain; name="cpuinfo.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="cpuinfo.txt"

processor=09: 0
vendor_id=09: AuthenticAMD
cpu family=09: 6
model=09=09: 8
model name=09: Unknown CPU Typ
stepping=09: 1
cpu MHz=09=09: 299.527
cache size=09: 64 KB
fdiv_bug=09: no
hlt_bug=09=09: no
f00f_bug=09: no
coma_bug=09: no
fpu=09=09: yes
fpu_exception=09: yes
cpuid level=09: 1
wp=09=09: yes
flags=09=09: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat pse36 mmx fxsr sse syscall mmxext 3dnowext 3dnow
bogomips=09: 593.46

processor=09: 0
vendor_id=09: AuthenticAMD
cpu family=09: 6
model=09=09: 8
model name=09: Unknown CPU Typ
stepping=09: 1
cpu MHz=09=09: 1897.009
cache size=09: 64 KB
fdiv_bug=09: no
hlt_bug=09=09: no
f00f_bug=09: no
coma_bug=09: no
fpu=09=09: yes
fpu_exception=09: yes
cpuid level=09: 1
wp=09=09: yes
flags=09=09: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat pse36 mmx fxsr sse syscall mmxext 3dnowext 3dnow
bogomips=09: 3758.61


------=_Part_32_582009.1093203240556
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_32_582009.1093203240556--

