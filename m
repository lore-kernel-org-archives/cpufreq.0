From: "Juan M. Duran" <duran@medicina.ub.es>
Subject: Re: Best CPU and Chipset for cpufreq?
Date: Wed, 14 Jan 2004 18:18:08 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1074100688.4376.12.camel@firebird.medicina.ub.es>
References: <20040114163958.GB1774@acheron.the-domination.com>
Reply-To: duran@medicina.ub.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040114163958.GB1774@acheron.the-domination.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

El mi=E9, 14-01-2004 a las 17:39, Jesper Anderson escribi=F3:

Hi everybody. It is my first post. Be merciful=20

> The current system I'm looking at has a Mobile AMD Athlon and a VIA
> chipset. Unfortunately the model is claimed to run hot and has low
> battery time, so I'd want to be able to choke it down as much as
> possible when I just sit and type on it.

I have an Acer 1314LC (VIA KN266 Athlon 2400+) and is really hot,
specially running  MSwindows. Fortunately, I have been using Fedora Core
1 with the default athlon kernel and Im able to put the Mhz down to the
minimun level. Just put on your local.rc something like

/sbin/modprobe powernow-k7
echo -n "0:1064000:1795500:powersave" > /proc/cpufreq
echo -n "0:789000:1795500:powersave" > /proc/cpufreq

I do this on two steps to avoid freezing the laptop.  At least with the
old cpufreq driver this problem happened and is quite frequent with
athlon laptops. (eg Acer aspire)

> Is this supported? Would I be better off looking at an Intel M model?
> Something else entirely?

IMHO, Intel M model is better processor for a laptop computer. Of course
the results not only depend of the processor, but also of the overall
construction of the laptop.

> PS. The model I'm looking at is the Acer Ferrari - rather sexy little
> beast. ;)

I have seen this model, and I must tell you that is much better than
aspire series and dissipates less heat (al least using my "hand-meter")=20

--=20

Juan M. Duran
Departamento de Biologia Celular y Anatomia Patologica=20
Facultad de Medicina
Universidad de Barcelona
C/ Casanova 143
08036 Barcelona, Spain
Tel. 34-93-4021909
Fax 34-93-4035260
