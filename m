From: Matthias Hannich <dumb@tcpa-info.org>
Subject: Re: Coppermine, cpufreq
Date: Thu, 30 Oct 2003 22:08:47 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FA17DDF.5000600@tcpa-info.org>
References: <3FA11700.8080908@tcpa-info.org>
	<20031030140910.GH28351@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031030140910.GH28351@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Am 10/30/2003 03:09 PM schrieb Ducrot Bruno:
> What about a
> modprobe speedstep-ich
> instead of insmod?

root:/# modprobe speedstep-ich
/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o:=20
init_module: No such device
Hint: insmod errors can be caused by incorrect module parameters,=20
including invalid IO or IRQ parameters.
       You may find more information in syslog or the output from dmesg=20
(can't find anything there)

/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o:=20
insmod=20
/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o faile=
d
/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o:=20
insmod speedstep-ich failed

> PS: If modprobe speedstep-ich still  do not work
> modpbore speedstep-lib

No error messages.

> modprobe speedstep-ich

The same as above.

Thanks, Matthias
--=20
Freundliche Gr=FC=DFe,          ###  http://www.stop1984.com
Matthias Hannich            ###  nulli@stop1984.com
                             ###  KeyID: 407A2F69
Fingerprint: 600D 7E07 105C F674 0C4B  12C2 4DE4 A8DF 407A 2F69
