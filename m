From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Dynamic frequency governor
Date: Fri, 17 Oct 2003 22:00:36 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1066453236.7590.4.camel@ixodes.goop.org>
References: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Moore, Robert" <robert.moore@intel.com>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Fri, 2003-10-17 at 14:14, Moore, Robert wrote:
> Hi all,
> 
> I've been chartered to implement a multi-state algorithm for Linux;
> this will be a new governor that adjusts the CPU frequency based upon
> percent CPU utilization as reported from the kernel idle handler.
> 
> Has any work been done (or is being done) in this area?  I don't want to
> rewrite the wheel.

Speedfreq (http://www.goop.org/~jeremy/speedfreq) does this in
userspace.  I'm not sure there's much win in putting it into the kernel,
but a better idle measurement would be nice (I use /proc/uptime, which
can only be reliably polled a couple of times a second).

	J
