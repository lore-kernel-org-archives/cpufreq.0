From: Dave Jones <davej@redhat.com>
Subject: Re: VIA C3 problems
Date: Wed, 17 Sep 2003 18:00:37 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030917170037.GA9933@redhat.com>
References: <20030916104052.53283.qmail@web13504.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030916104052.53283.qmail@web13504.mail.yahoo.com>
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
To: Scott Russ <scott@linuxjihad.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Sep 16, 2003 at 03:40:52AM -0700, Scott Russ wrote:
 > I am having problems with using cpufreq.  I used to use it fine and just
 > recently tried applying it again.  I am using 2.4.22 with the CK-2 patches
 > (http://members.optusnet.com.au/ckolivas/kernel/).
 > 
 > When I modprobe longhaul I get a kernel oops and lsmod shows longhaul as still
 > initalizing and I can't rmmod.  I also tried the 2.4.22-ac2 patch which
 > includes cpufreq with the same results.  Any suggestions?

Known bug, fixed in 2.6, needs backporting to 2.4-ac

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
