From: David Kar-Fai Tam <tamda@eecg.toronto.edu>
Subject: Re: Dynamic frequency governor
Date: Mon, 22 Dec 2003 16:41:40 -0500 (EST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0312221635550.23136-100000@cat.eecg.toronto.edu>
References: <Pine.LNX.4.44.0310180228350.14780-100000@cat.eecg.toronto.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44.0310180228350.14780-100000@cat.eecg.toronto.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: wtsang@dgp.toronto.edu, Catalin Drula <catalin@cs.toronto.edu>

On Sat, 18 Oct 2003, David Kar-Fai Tam wrote:
> I am a graduate student working on a course project involving
> implementing DVS algorithms on mobile devices.
> 
> We (3 graduate students) are attempting to implement several DVS
> algorithms (as described in various research papers) in Linux 2.6 using
> the CPUFreq API. According to Dominik Brodowski, we will be attempting to 
> implement a dynamic governor for the CPUFreq API.
> We plan to do this in the kernel.
> 
> You can check out our project website at
> http://www.eecg.toronto.edu/~tamda/csc2228/
> You will find a proposal and a recent progress report.

Status update:
We have finished our DVS project.
If interested, please check out the above website.
There is a final report, presentation slides describing our
accomplishments, and source code.

We have implemented the AVGn, past, peak, and our own "future" DVS 
algorithms on kernel 2.6.0-test9.

Thanks.

--
David Tam
tamda@eecg.toronto.edu
