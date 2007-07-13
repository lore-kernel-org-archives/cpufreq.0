From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Problem with acpi-cpufreq on 8-core machines
Date: Fri, 13 Jul 2007 09:36:43 +0800
Message-ID: <1184290605.2695.1.camel@laptopd505.fenrus.org>
References: <c583a31b0707111737s237dcde8m211ac2c192668300@mail.gmail.com>
	<1184220147.2720.1.camel@laptopd505.fenrus.org>
	<c583a31b0707121517x509ab63cl2d8a834c153dae02@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <c583a31b0707121517x509ab63cl2d8a834c153dae02@mail.gmail.com>
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
To: Lei Yang <leiyang@google.com>
Cc: cpufreq@lists.linux.org.uk

> lowset.  If BIOS is doing Sw_ANY the core in question will also have a
> low frequency value instead of staying high, and you will get this
> failure.". I thought the one particular CPU whose frequence is set to
> the highest should also have a low frequency value when 'all' cpus are
> scaled back to the lowest. Or am I missing something? 


it's "all but the one being tested" :)

-- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com
Test the interaction between Linux and your BIOS via http://www.linuxfirmwarekit.org
