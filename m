From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: kernel 2.4.20
Date: Tue, 13 Jan 2004 16:51:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040113155128.GM14031@poupinou.org>
References: <20040113111042.DB6113958@sitemail.everyone.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040113111042.DB6113958@sitemail.everyone.net>
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
To: gojyo <guardian@killamail.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Jan 13, 2004 at 03:10:42AM -0800, gojyo wrote:
> I need to patch a 2.4.20 kernel; however, with the last release of cpufreq for 2.4 kernels I have lot of patch errors. In the ftp archive I can't understand which version I need, can you help me please? Which release do I need for 2.4.20 kernel?

You have 2 solutions:
1- integrate by hand the rejected patch,
2- use cvs with:

cvs -d:pserver:cvs@pubcvs.arm.linux.org.uk:/mnt/src/cvsroot co -rlinux_2_4_old cpufreq

which was done before the new core for 2.4 was updated (first done for
linux-2.4.21 IIRC).

BUT this one is old and contains well known bugs that have been fixed.

If I were you, I will integrate by hand the latest (that should be not
so hard).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
