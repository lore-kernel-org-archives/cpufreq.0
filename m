From: Dave Jones <davej@redhat.com>
Subject: Re: Dynamic frequency governor
Date: Mon, 20 Oct 2003 16:39:37 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031020153936.GM2729@redhat.com>
References: <CFF522B18982EA4481D3A3E23B83141C24B4B0@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <CFF522B18982EA4481D3A3E23B83141C24B4B0@orsmsx407.jf.intel.com>
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
Cc: "Walz, Michael" <michael.walz@intel.com>, cpufreq@www.linux.org.uk

On Mon, Oct 20, 2003 at 08:31:08AM -0700, Moore, Robert wrote:
 > 
 > I'm planning on integrating the previously released Linux IST (Intel
 > Speedstep) driver into the CpuFreq architecture.

Cool, but what does it do that the existing cpufreq speedstep drivers don't ?

 > I think that what is gained by having this code in the kernel is that a
 > very accurate measure of percent CPU utilization can be obtained
 > directly from the kernel idle handler, and there is less overhead during
 > the periodic sampling of the current CPU utilization by a timer thread.

I'm not disputing whether or not putting this in the kernel is a good
or bad thing (for the record, I think it's a good idea), however the
fact remains, whilst there are folks owning patents on this, it'll
*never* be acceptable for merging without an exception grant from the
patent holder.

		Dave


 > From: Dave Jones [mailto:davej@redhat.com] 
 > Sent: Sunday, October 19, 2003 6:24 AM
 > To: Moore, Robert
 > Cc: cpufreq@www.linux.org.uk
 > Subject: Re: Dynamic frequency governor
 > 
 > On Fri, Oct 17, 2003 at 02:14:38PM -0700, Moore, Robert wrote:
 >  
 >  > I've been chartered to implement a multi-state algorithm for Linux;
 >  > this will be a new governor that adjusts the CPU frequency based upon
 >  > percent CPU utilization as reported from the kernel idle handler.
 >  > 
 >  > Has any work been done (or is being done) in this area?  I don't want
 > to
 >  > rewrite the wheel.
 > 
 > There are several patents in this area (I think from Hitachi, I forget
 > exactly) It has come up before on the list, so should be in the
 > archives.  Unless you can get a grant from the holder that it may be
 > used in GPL code, this has zero chance of being merged to mainline.
 > 
 > 		Dave
 > 
 > -- 
 >  Dave Jones     http://www.codemonkey.org.uk
---end quoted text---

-- 
 Dave Jones     http://www.codemonkey.org.uk
