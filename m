From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Silly bug (typo?) in cpufreq from 2.4.21-ac4
Date: Fri, 4 Jul 2003 17:17:35 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030704151735.GD7796@poupinou.org>
References: <200307021942.36520.lbelli@crema.unimi.it>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200307021942.36520.lbelli@crema.unimi.it>
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
To: Luigi Belli <lbelli@crema.unimi.it>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 02, 2003 at 07:42:36PM +0200, Luigi Belli wrote:
> Ok, I discovered with the help of x86info why after my patch in certain 
> situation I still had higher temperature than in Windows...
> 
> From powernow-k7.c, line 298:
> 
> } else {
> 	/* Going up, so change VID first */
> 	change_VID(fid);
> 	change_FID(vid);
> }
> 
> 

CVS trunk have the same issue, btw...

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
