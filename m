From: David Kar-Fai Tam <tamda@eecg.toronto.edu>
Subject: Re: Dynamic frequency governor
Date: Sat, 18 Oct 2003 02:44:21 -0400 (EDT)
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0310180228350.14780-100000@cat.eecg.toronto.edu>
References: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Moore, Robert" <robert.moore@intel.com>
Cc: cpufreq@www.linux.org.uk

On Fri, 17 Oct 2003, Moore, Robert wrote:

> I've been chartered to implement a multi-state algorithm for Linux;
> this will be a new governor that adjusts the CPU frequency based upon
> percent CPU utilization as reported from the kernel idle handler.
> 
> Has any work been done (or is being done) in this area?  I don't want to
> rewrite the wheel.

I am a graduate student working on a course project involving
implementing DVS algorithms on mobile devices.

We (3 graduate students) are attempting to implement several DVS
algorithms (as described in various research papers) in Linux 2.6 using
the CPUFreq API. According to Dominik Brodowski, we will be attempting to 
implement a dynamic governor for the CPUFreq API.
We plan to do this in the kernel.

You can check out our project website at
http://www.eecg.toronto.edu/~tamda/csc2228/
You will find a proposal and a recent progress report.

--
David Tam
tamda@eecg.toronto.edu
