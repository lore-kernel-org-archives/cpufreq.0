From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Re: my dothan didn't work with cpufreq...
Date: Fri, 16 Jul 2004 10:19:48 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040716081948.GA9620@dominikbrodowski.de>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<40F50FE1.10405@lifl.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40F50FE1.10405@lifl.fr>
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
To: Damien Marchal <marchal@lifl.fr>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 14, 2004 at 12:50:09PM +0200, Damien Marchal wrote:
> Hi,
> 
> i check my .config and saw that the X86_SPEEDSTEP_CENTRINO_TABLE was 
> always set to Y and it can be changed by make menuconfig.
> 
> By manually editing it to N give me a fully functional cpufreq module.

Hm, that's strange. the tables are only used if ACPI fails... so saying Y to
ACPI seems to be more important (for Dothan users) than setting TABLE to N
to me...

	Dominik
