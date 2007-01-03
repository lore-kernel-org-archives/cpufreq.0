From: Jorgen <jorgen@greven.dk>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Wed, 3 Jan 2007 23:10:11 +0000 (UTC)
Message-ID: <loom.20070104T000819-223@post.gmane.org>
References: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
	<20070102173601.GD7656@redhat.com> <459AA1F9.3040701@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="utf-8"
To: cpufreq@lists.linux.org.uk

Rafał Bilski <rafalbilski <at> interia.pl> writes:

> >  > But cpufreq does not work.
> >  > 
> >  > Can I in some way help with testing/debugging the cpufreq driver (centrino
> >  > or longhaul?) for this cpu?
> > 
> > The C7 works fine with acpi-cpufreq if the correct BIOS tables are present.
> > Support *could* be added to speedstep-centrino to use hardcoded tables
> > for these CPUs for systems where the BIOSes lack them, but hasn't been
> > done yet.
> > 
> Beauty of "Enhanced PowerSaver" is in that hardcoded tables are not necessary. 
> Would be very easy to add ACPI independent driver for these CPU's. If somebody 
> would test it then I can try.
> What do You think?
> 
> Rafał
> 
> ----------------------------------------------------------------------
> Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
> 

If you need a tester with a Via C7 PC, I'm ready to do do it.

Looks as acpi-cpufreq only works on Intel h/w, and longhaul are not going to
support Via C7, so I'm left out in the cold.

Brgds Jorgen
