From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Fri, 4 Aug 2006 00:02:21 +0900
Message-ID: <a11ccc30608030802j57c2dc19h9298d001e81faaa1@mail.gmail.com>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
	<a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kay@rz.fh-augsburg.de
Cc: cpufreq@lists.linux.org.uk

Oh, I'm sorry I mistook the expression.

In early generaion of speedstep technology, a circuit which
changes cpu frequency and voltage is connected to south bridge
GPIO port or specific port.

It may be controlled by single flag(1/0), so it can serve
only two frequency value.

Recent ich driver use a specific register port to control
the circuit.(outb(value, (pmbase + 0x50));)

Hiroshi

2006/8/3, Hiroshi Miura <miura@da-cha.org>:
> And speedstep-ich is based on reverse engineering basis.
> It try to find proper register location and value by watching
> difference of chipset registers  between AC powered and battery
> powered state.
-- 
HIroshi Miura
