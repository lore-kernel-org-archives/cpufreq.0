From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Can you please try this powernow-k8.c patch ?
Date: Tue, 16 Nov 2004 21:47:03 +0100
Message-ID: <20041116204703.GA9138@dominikbrodowski.de>
References: <200411161753.11367.mpytasz@pai.net.pl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200411161753.11367.mpytasz@pai.net.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Micha?? Pytasz <mpytasz@pai.net.pl>
Cc: cpufreq@www.linux.org.uk

On Tue, Nov 16, 2004 at 05:53:11PM +0000, Micha?? Pytasz wrote:
> Also I can see in /sys/devices/system/cpu/cpu0/cpufreq a changed value of 
> frequency, is it possible to see if voltage changes as well?

AFAICS, your system only supports two frequency states with different
voltages. Also, the powernow-k8 driver complains if one transition
(frequency or voltage) fails. So you can be quite sure that the voltage
changes as well.

	Dominik
