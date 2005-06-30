From: =?ISO-8859-1?Q?Jaime_Pe=F1alba?= <jpenalbae@gmail.com>
Subject: Re: More Pentium III (Coppermine) problems
Date: Fri, 1 Jul 2005 00:39:19 +0200
Message-ID: <edaeffdd05063015391de04e8@mail.gmail.com>
References: <edaeffdd05063015115b422687@mail.gmail.com>
	<20050630222500.GA8564@isilmar.linta.de>
Reply-To: =?ISO-8859-1?Q?Jaime_Pe=F1alba?= <jpenalbae@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050630222500.GA8564@isilmar.linta.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk, linux@dominikbrodowski.net

also doesnt work ;(

speedstep-lib: x86: 6, model: 8
speedstep-lib: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x44080020, 0x0
speedstep-lib: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x2560000
speedstep-smi: signature:0x00008680, command:0x0000e6f5,
event:0x00000000, perf_level:0x47534943.
speedstep-smi: trying to obtain ownership with command 47534982 at port b2
speedstep-smi: result is 0
speedstep-smi: bug #1422 -- can't read freqs from BIOS
speedstep-smi: could not detect low and high frequencies by SMI call.
speedstep-lib: trying to determine both speeds
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: speed is 500000
speedstep-lib: previous seped is 500000
speedstep-smi: trying to set frequency to state 1 with command
47534982 at port b2
speedstep-smi: retry 1, previous result 0, waiting...
speedstep-smi: retry 2, previous result 0, waiting...
speedstep-smi: retry 3, previous result 0, waiting...
speedstep-smi: retry 4, previous result 0, waiting...
speedstep-smi: retry 5, previous result 0, waiting...
cpufreq: change failed with new_state 2 and result 0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: speed is 500000
speedstep-lib: low seped is 500000
speedstep-smi: trying to set frequency to state 0 with command
47534982 at port b2
speedstep-smi: retry 1, previous result 0, waiting...
speedstep-smi: retry 2, previous result 0, waiting...
speedstep-smi: retry 3, previous result 0, waiting...
speedstep-smi: retry 4, previous result 0, waiting...
speedstep-smi: retry 5, previous result 0, waiting...
cpufreq: change failed with new_state 2 and result 0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: speed is 500000
speedstep-lib: high seped is 500000
speedstep-smi: could not detect two different speeds -- aborting.

Any more sugestions?

Thanks,
Jaime.

2005/7/1, Dominik Brodowski <linux@dominikbrodowski.net>:
> Hi,
>=20
> please try out
>=20
> modprobe speedstep-smi smi_cmd=3D0x82 smi_port=3D0xb2 smi_sig=3D1
>=20
>=20
>         Dominik
>
