From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k7, something broke in -test3?
Date: Sat, 16 Aug 2003 14:59:22 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030816135922.GQ22433@redhat.com>
References: <Pine.LNX.4.44.0308102141570.4848-100000@pianoman.cluster.toy> <Pine.LNX.4.44.0308160115110.27055-100000@pianoman.cluster.toy>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0308160115110.27055-100000@pianoman.cluster.toy>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Clemens <john@deater.net>
Cc: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

On Sat, Aug 16, 2003 at 01:24:58AM -0400, John Clemens wrote:
 > 
 > Hi Dave,
 > 
 > The following patch corrects a minor think-o in your powernow-k7 changes
 > that went into 2.6.0-test3, and was causing the behavior below.  I don't
 > think you meant to cache the cfid value before you actually read it in :)
 > this was causing all speed notifications to think my previous multiplier
 > was fid_codes[0] (11.0x), and thus screws up loops_per_jiffy, etc..

oh boy, how dumb am I.
Thanks, applied and pushed for 2.6-test4

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
