From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] Remove notify in speedstep_set_state [1/2]
Date: Fri, 11 Jun 2004 15:07:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611130745.GH1095@poupinou.org>
References: <20040611100223.GD1095@poupinou.org>
	<20040611121821.GD8779@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040611121821.GD8779@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Fri, Jun 11, 2004 at 01:18:22PM +0100, Dave Jones wrote:
> On Fri, Jun 11, 2004 at 12:02:23PM +0200, Bruno Ducrot wrote:
>  > Remove 'notify' in speedstep_set_state for speedstep-lib
>  > 
>  > Signed-off-by:  Bruno Ducrot <ducrot@poupinou.org>
> 
> How about [3/2] Fix speedstep-ich 8-)

It's expected to be done by the latest
speedstep_patch.2.6.7-rc3_SMT.diff from Christian Hoelbling ;)

> The p4-clockmod change also broke the compile here, but I'm fixing
> that up (just looks like a missing #include)

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
