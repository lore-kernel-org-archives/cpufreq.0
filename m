From: Mattia Dongili <malattia@linux.it>
Subject: Re: cpufreq on Coppermine
Date: Sun, 20 Nov 2005 15:33:33 +0100
Message-ID: <20051120143332.GF4582@inferi.kami.home>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051118154149.GA2104@poupinou.org>
	<460afdfa0511181139p40db432fm544e480f554e9a0@mail.gmail.com>
	<20051119192909.GA4190@inferi.kami.home>
	<460afdfa0511191719s6749b5cfq93bad11d1a878d89@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <460afdfa0511191719s6749b5cfq93bad11d1a878d89@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca <luca.foppiano@gmail.com>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>

On Sun, Nov 20, 2005 at 02:19:28AM +0100, Luca wrote:
> On 11/19/05, Mattia Dongili <malattia@linux.it> wrote:
> > > I think don't work with 2.6 kernel...
> >
> > just for the purpose to make it build you can apply the attached patch,
> > it uses an adapted (from LDD3) Makefile for 2.6 and changes from
> > pci_find_subsys to pci_get_subsys. Still, you need to define
> > I_WANT_SPEEDSTEP at line 42 as before.
> 
> I do the patch and I compile the speedstep_bx, this is the result:
> 
[...]
>   MODPOST
> *** Warning: "__fixunsdfsi" [/usr/local/src/speedstep_bx/speedstep.ko]
> undefined!
> *** Warning: "__divdf3" [/usr/local/src/speedstep_bx/speedstep.ko] undefined!
> *** Warning: "__muldf3" [/usr/local/src/speedstep_bx/speedstep.ko] undefined!
> *** Warning: "__adddf3" [/usr/local/src/speedstep_bx/speedstep.ko] undefined!
> *** Warning: "__floatsidf" [/usr/local/src/speedstep_bx/speedstep.ko] undefined!
>   LD [M]  /usr/local/src/speedstep_bx/speedstep.ko
> make[1]: Leaving directory `/usr/src/linux-2.6.14'
> pj@cristal:/usr/local/src/speedstep_bx$

Ah, -msoft-float. Either change the '#if 0' to '#if 1' at line 449 or
build with 'make EXTRA_CFLAGS=-mhard-float'

-- 
mattia
:wq!
