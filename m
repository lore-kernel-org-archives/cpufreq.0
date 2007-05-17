From: Wes Felter <wesley@felter.org>
Subject: Re: cpufreq throttling driver
Date: Thu, 17 May 2007 12:35:35 -0500
Message-ID: <f2i3pf$shb$1@sea.gmane.org>
References: <loom.20070516T213237-839@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <loom.20070516T213237-839@post.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Matthieu CASTET wrote:
> Hi,
> 
> I have a desktop cpu supporting only throttling (no C-state and no P-state
> (acpi-cpufreq refuse to load)).
> 
> Does it make sense to use throttling to save some power ?

Not really. You can save a little power but you will lose a lot of 
performance, making your system less energy-efficient.

> If yes why aren't there a cpufreq driver for managing throttling ?

It's called p4-clockmod. Don't use it. If you want to save power, get a 
new CPU.

Wes Felter - wesley@felter.org
