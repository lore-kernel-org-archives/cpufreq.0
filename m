From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: AMD Athlon 64 2800+ ("Newcastle") Socket 754
Date: Tue, 29 Mar 2005 16:01:38 +0200
Message-ID: <20050329140138.GA19654@isilmar.linta.de>
References: <1112103103.3156.48.camel@localhost.localdomain>
	<9268368b05032905563107221b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <9268368b05032905563107221b@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Petrini <d.pensator@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Mar 29, 2005 at 09:56:10AM -0400, Daniel Petrini wrote:
> Hello all,
> 
> In the same thread I'd like to ask if is it possible to slow down a
> "Intel(R) Xeon(TM) CPU 3.40GHz" with the appropriate module
> ()p2_clockmod)?
You're referring to p4_clockmod, and its possible to use it to slow down said 
processor, AFAIK.
However, it does not scale _voltage_ (and only throttles but does not scale
frequency) like 'Cool'n Quiet' or 'Demand-Based-Switching'. Some recent
Intel Xeon processors are capable of dynamic frequency and voltage scaling,
so you should try out "acpi-cpufreq" and "speedstep-centrino" first.

	Dominik
