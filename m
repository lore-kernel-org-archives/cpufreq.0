From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Thu, 19 Aug 2004 20:39:03 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040819193903.GB17897@redhat.com>
References: <cg2jui$tba$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <cg2jui$tba$1@sea.gmane.org>
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
To: Ari Pollak <ajp@aripollak.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Aug 19, 2004 at 12:19:32PM -0400, Ari Pollak wrote:
 > Hi there.. I'm trying to load the powernow-k8 module under kernel 
 > 2.6.8.1 built for i386/Athlon64, but it won't load. I get the following 
 > kernel messages instead:
 > powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
 > powernow-k8: Too many lo freq table entries
 > powernow-k8: BIOS error: PSB table is not v1.4
 > FATAL: Error inserting powernow_k8 
 > (/lib/modules/2.6.8.1/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k8.ko): 
 > No such device

There's quite a backlog of cpufreq bits pending which are due to be
merged hopefully next week. (Linus is on vacation right now)

Can you try http://www.codemonkey.org.uk/projects/cpufreq/daily-snapshots/cpufreq-2004-08-19.diff
and see if that fixes it for you ? (I think it will)

		Dave
