From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 3 Sep 2003 21:27:49 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903192749.GA30360@brodo.de>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
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
Content-Transfer-Encoding: 7bit
To: Norbert Preining <preining@logic.at>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 07:57:49AM +0200, Norbert Preining wrote:
> Hi!
> 
> Which cpufreq driver is best for 
> 	Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
> I can use the
> 	p4-clockmod
> and the
> 	speedstep-ich
> With the p4-clockmod I can adapt the freq between 274MHz and 2.2GHz,
> while with speedstep-ich I can only go between 1.2GHz and 2.2GHz. So I
> guess p4-clockmod is superior for my chip/cpu.
No, speedstep-ich is "superior". p4-clockmod only "throttles" the CPU, i.e.
it scales down the frequency but not the voltage. This results in an
approximately linear saving of energy. speedstep-ich also scales the
voltage, which causes much better saving of energy. 

And as long as ACPI C-States "idling" or APM "hlt" instructions work, the
CPU is "throttled"[*] if there is no work to do anyway, so the p4-clockmod
driver doesn't save you anything. The p4-clockmod driver almost only is
useful where ACPI or APM "idling" is borken.

> In the same line - are there any new governors with `intelligent'
> scaling techniques.

Not yet. Stay tuned, please.

	Dominik

[*] I know, this isn't technically true. But it's a good approximation...
