From: Thomas Tuttle <thinkinginbinary@gmail.com>
Subject: Re: Re: speedstep-centrino does not load on an Intel(R) Pentium(R)
	M processor 1.70 GHz
Date: Mon, 2 Aug 2004 07:57:40 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <e4cb198704080204577ba467ee@mail.gmail.com>
References: <e4cb198704073119587d687f91@mail.gmail.com>
	<1091332584.9043.4.camel@localhost>
	<e4cb198704080108427e7a20b5@mail.gmail.com>
	<1091403320.9043.17.camel@localhost>
	<e4cb198704080118296f1168c4@mail.gmail.com>
	<1091422655.9043.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1091422655.9043.22.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: linux@dominikbrodowski.de, cpufreq list <cpufreq@www.linux.org.uk>

If it is compiled in to the kernel, I get the "Found unsupported
CPU..." message.
If it is a module with the original code or with the patch you gave
me, I get "No support for CPU model...email [you]".
If I make a module with the full replacement for speedstep-centrino.c
you gave me, I get "No table support for CPU model".

I'm not sure why, but it doesn't seem to be able to retrieve the
frequency/voltage tables from the BIOS, no matter how I compile it.

Are there any tests I can run to just display the tables or see if
they can be read?

On Sun, 01 Aug 2004 21:57:35 -0700, Jeremy Fitzhardinge <jeremy@goop.org> wrote:
> On Sun, 2004-08-01 at 21:29 -0400, Thomas Tuttle wrote:
> > Okay... here's the scoop.
> >
> > My laptop has one of the new Dothan processors, and neither Jeremy's
> > version of speedstep-centrino.c or the patch that ignores invalid
> > frequency/voltage table entries seems to fix it.  I've tried it as a
> > module and compiled in, and with and without the ACPI tables option
> > turned on, and I get the following results:
> >
> > When I modprobe speedstep-centrino module, I get 'No such device'.
> > dmesg reveals a message stating that my processor is unsupported.
> >
> > When I modprobe acpi (the "ACPI Processor Power States" module, which,
> > I assume, is a way of accessing speedstep-like stuff through the ACPI
> > BIOS rather than through speedstep's interface--or maybe speedstep
> > uses that), I get 'No such device' also, with no messages in dmesg to
> > reveal further problems.
> >
> > Jeremy: I tried enabling the DEBUG option (uncommented the #define) in
> > speedstep-centrino.c, but there's no more insight into the problem.
> 
> Hm.  What messages do appear in the dmesg output?  Is it "no support for
> CPU model ...", "no table support for CPU model ..." or "found
> unsupported CPU with Enhanced SpeedStep: ...".  Or something else?
> 
>         J
> 
> 


-- 
/"\                              | Thomas Tuttle
\ /    ASCII Ribbon Campaign     | Email: thinkinginbinary@gmail.com
 X   against HTML email          | AIM:   thinkinginbinary
/ \                              | Web:   http://thinkinginbinary.webhop.net
---------------------------------+

Want a Gmail invite?  Send a message to thinkinginbinary@gmail.com
with "request_gmail_invite" in the subject (without the quotes, with
the underscore) and you will be added to my waiting list.
