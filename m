From: "NY0" <nyo@xnetpro.it>
Subject: Re: Cpufreq digest, Vol 1 #461 - 2 msgs
Date: Tue, 1 Jul 2003 06:36:10 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <000801c33f8a$4d3b8950$7300a8c0@Sword>
References: <20030630110001.16546.19634.Mailman@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk


----- Original Message -----
From: <cpufreq-request@www.linux.org.uk>
To: <cpufreq@www.linux.org.uk>
Sent: Monday, June 30, 2003 1:00 PM
Subject: Cpufreq digest, Vol 1 #461 - 2 msgs


> Send Cpufreq mailing list submissions to
> cpufreq@www.linux.org.uk
>
> To subscribe or unsubscribe via the World Wide Web, visit
> http://www.linux.org.uk/mailman/listinfo/cpufreq
> or, via email, send a message with subject or body 'help' to
> cpufreq-request@www.linux.org.uk
>
> You can reach the person managing the list at
> cpufreq-admin@www.linux.org.uk
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Cpufreq digest..."
>
>
> Today's Topics:
>
>    1. Re: overclocking? (Benjamin Herrenschmidt)
>    2. (no subject) (linux warrior)
>
> --__--__--
>
> Message: 1
> Subject: Re: overclocking?
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> To: Rees Boffey <rees_b@bigpond.com>
> Cc: cpufreq@lists.arm.linux.org.uk
> Date: 30 Jun 2003 00:24:49 +0200
>
> On Sun, 2003-06-29 at 05:42, Rees Boffey wrote:
> > in the cpufreq documenatation in my 2.4.21-benh kernel it mentions that
> > arguments echoed to the /proc/cpufreq entry are first validated before
any
> > changes are made. my question is, is it possible to remove this
validatio
> > to allow the overclocking of the cpu?
> > the ibook2.2 that i use is possible of being overclocked via software
using
> > an early version of the CHUD tools for osx but as of yet i have not
found a
> > way to do it under linux.
> > appreciate any replies/flames :)
>
> Well... some PowerMac models support only dual speeds (via PMU changing
the
> PLL strapping & resetting the CPU). Some others (the 750FX based iBooks)
> could in theory be programmed to any speed supported by the PLL...
Currently,
> I do not have code to take advantage of this "feature". Those chips have 2
> PLLs and can switch instantly between them. One is setup for full speed,
> the other for "low speed" by the firmware, all I support via cpufreq so
far
> is to switch between those 2
>
> Ben.
>
>
>
> --__--__--
>
> Message: 2
> From: "linux warrior" <linuxwarrior@hotmail.com>
> To: cpufreq@www.linux.org.uk
> Date: Mon, 30 Jun 2003 03:54:02 -0300
> Subject: (no subject)
>
> Hello to everybody!
> I have a Pentium M (Centrino) notebook, and while I was recompiling my
> kernel (2.4.21-ac4) y wondered if I had to compile it for PIII or for P4
...
> I went with the last one, and enabled ACPI, and cpufreq for Pentium-M.
> I get an ACPI_processor_get (something regarding address space) error at
> boot and I found no way to change cpu speed thru the /proc filesystem.
> Any clues ? please tell me what info might be of help as cat /proc/cpuinfo
> etc.
>
> Thanks
> linuxwarrior
>
> _________________________________________________________________
> Add photos to your e-mail with MSN 8. Get 2 months FREE*.
> http://join.msn.com/?page=features/featuredemail
>
>
>
>
> --__--__--
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
>
> End of Cpufreq Digest
>
>
with centrino you need to specify P3 on kernel compiling..
