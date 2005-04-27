From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 13:02:57 +0200
Message-ID: <20050427110257.GY2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050427105350.GX2298@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Cc: cpufreq@lists.linux.org.uk

On Wed, Apr 27, 2005 at 12:53:50PM +0200, Bruno Ducrot wrote:
>  #define __set_task_state(tsk, state_value)		\
> -	do { (tsk)->state = (state_value); } while (0)
> -#define set_task_state(tsk, state_value)		\
> -	set_mb((tsk)->state, (state_value))
> 
> Look a little bit more the macro you just removed here.
> Its expected to return a value, namely 'state_value'.

Oops, its me that need to read this more carrefully..  Sorry.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
