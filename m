From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: iBook G3 upon resume...
Date: Fri, 16 Jul 2004 10:24:40 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040716082440.GA9707@dominikbrodowski.de>
References: <1089615548.3485.4.camel@hermione.aeon.com.my>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1089615548.3485.4.camel@hermione.aeon.com.my>
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
To: Colin Charles <byte@aeon.com.my>, benh@kernel.crashing.org
Cc: cpufreq@www.linux.org.uk

On Tue, Jul 13, 2004 at 07:59:22PM +0800, Colin Charles wrote:
> Hi (Dave?),
not only Dave reads this list :)
> 
> Following error message pop's up, with an iBook G3 800MHz, running
> Fedora PPC (Rawhide, relatively latest - not quite up to FC3test1
> though)
> 
> cpufreq: resume failed to assert current frequency is what timing core
> thinks it is.

The problem is that the PPC cpufreq driver doesn't yet implement a
"get_current_frequency" function. As -- at least on x86 hardware -- it isn't
guarantueed that the frequency upon resume is the same as when going to
sleep, the cpufreq core wants to compare the result of
"get_current_frequency" with what it saved before going to sleep. 


Ben: in pmac_cpufreq_setup there's this code snippet:

	/* Get current cpu clock freq */
	value = (u32 *)get_property(cpunode, "clock-frequency", NULL);
	if (!value)
		goto out;
	cur_freq = (*value) / 1000;

Does "get_property(,"clock-frequency",)" return appropriate results even
after frequency transitions? If so, we could use that for the
"get_current_frequency" function.

	Dominik
