From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [PATCH] cpufreq: speedstep-centrino should only decode MSR on
	certain CPUs
Date: Wed, 08 Sep 2004 18:45:19 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1094694319.3107.70.camel@localhost>
References: <20040904075507.GA3438@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040904075507.GA3438@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq list <cpufreq@www.linux.org.uk>

On Sat, 2004-09-04 at 09:55 +0200, Dominik Brodowski wrote:
> The encoding of the MSR only works as described in extract_clock() on
> certain EST-enabled CPUs. So, limit the actual MSR check to these
> CPUs.

What are the others?  EST-enabled P4 machines?

	J
