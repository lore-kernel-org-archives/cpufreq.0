From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep for P4M on ALi  M1671
Date: Mon, 23 Aug 2004 17:32:54 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040823153254.GH29560@poupinou.org>
References: <200408231221.07132.clemens.orthacker@xicrypt.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200408231221.07132.clemens.orthacker@xicrypt.com>
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
To: Clemens Orthacker <clemens.orthacker@xicrypt.com>
Cc: cpufreq@www.linux.org.uk

Hi,

On Mon, Aug 23, 2004 at 12:21:07PM +0200, Clemens Orthacker wrote:
> Does this mean that speedstep works for me (with voltage scaling?)?
> 
> $ dmesg | grep -i cpufreq
> cpufreq: CPU0 - ACPI performance management activated.
> cpufreq:  P0: 1900 MHz, 0 mW, 250 uS
> cpufreq: *P1: 1200 MHz, 0 mW, 250 uS

This work via CONFIG_X86_ACPI_CPUFREQ.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
