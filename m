From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: banias with different (unusual?) model_name
Date: Fri, 20 Aug 2004 19:19:31 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1093054772.3043.3.camel@localhost>
References: <20040820093344.GA2923@akamail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040820093344.GA2923@akamail.com>
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
To: matthias.brill@akamail.com
Cc: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq list <cpufreq@www.linux.org.uk>

On Fri, 2004-08-20 at 11:33 +0200, matthias brill wrote:
> hi jeremy
> 
> i've found a pentium-m banias which reports "Mobile Genuine Intel(R)
> processor       1400MHz" in /proc/cpuinfo.  this (strange?) signature
> prevents speedstep-centrino.c from working properly.

Yeah, there seem to be a few of these around.  I'm just not certain that
they're identical to "normal" Banias as far as operating points go.

	J
