From: Dave Jones <davej@redhat.com>
Subject: Re: Dynamic frequency governor
Date: Sun, 19 Oct 2003 14:24:23 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031019132422.GE8018@redhat.com>
References: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: "Moore, Robert" <robert.moore@intel.com>
Cc: cpufreq@www.linux.org.uk

On Fri, Oct 17, 2003 at 02:14:38PM -0700, Moore, Robert wrote:
 
 > I've been chartered to implement a multi-state algorithm for Linux;
 > this will be a new governor that adjusts the CPU frequency based upon
 > percent CPU utilization as reported from the kernel idle handler.
 > 
 > Has any work been done (or is being done) in this area?  I don't want to
 > rewrite the wheel.

There are several patents in this area (I think from Hitachi, I forget
exactly) It has come up before on the list, so should be in the
archives.  Unless you can get a grant from the holder that it may be
used in GPL code, this has zero chance of being merged to mainline.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
